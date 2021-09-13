(modules)=

# Software Modules

ARC uses the [lmod environment modules system](https://www.tacc.utexas.edu/research-development/tacc-projects/lmod) to enable access to centrally-installed (ARC-maintained) scientific software packages. This provides for the dynamic modification of a user\'s environment for an application or set of applications, enabling streamlined management of software versions and dependencies. 

## Structure

Modules on ARC systems are based on a hierarchical structure where the modules that are available in one level of the hierarchy depend on the modules loaded from the previous level. This ensures that users do not inadvertently select module combinations that are incompatible and/or give inferior performance. The module levels are: 
1. **Compiler:** Users first select the compiler that they want to use.
2. **MPI Stack:** Users then select the MPI stack that they want to use. MPI stack availability depends on the compiler that is loaded.
3. **High Level Software:** Once a user has selected both a compiler and an MPI stack, they can load higher-level software built against that compiler and MPI stack.

Please consult the software documentation for each system to determine that system\'s default compiler and MPI stack. Note that the default compiler and MPI stack are automatically loaded, so if a user wishes to use the system defaults for each, they can simply start loading higher-level modules as soon as they log in. If not, the user may use the module swap command to replace one module with another or the module purge command to remove all modules and then load the modules that they want. # <a name="usage"></a>Usage

To change or view modules, the module command is used. The most common subcommands are: - View a list of available modules (depends on the currently loaded modules): 
```
  module avail
```
- List all possible modules with the name modulename: 
```
  module spider modulename
```
- Print information about the modulename module, such as what the software package is, what environment variables and paths it sets, and what its dependencies are: 
```
  module show modulename
```
- View a list of modules currently loaded in your environment: 
```
  module list
```
- Add a module to your environment with one of the following: 
```
  module add modulename
  module load modulename
```
- Remove a module from your environment with one of: 
```
  module rm modulename
  module unload modulename
```
- Replace module1 with module2 in your environment. Any dependent modules in the module tree will be reloaded to reflect the change. 
```
  module swap module1 module2
```
- Remove all modules from your environment: 
```
  module purge
```

The module command can be used at the command line and within job launch scripts. # <a name="examples"></a>Examples

## Loading Software

The most basic module usage would be loading the gcc compiler and the statistical software R built against gcc: 

```
module purge         #Make sure no modules are loaded
module load gcc R    #Load gcc compiler and R (built against gcc)
module list          #Print currently loaded modules
```

We see that a gcc module and an R module are loaded: 
```
Currently Loaded Modules:
  1) gcc/4.7.2    2) R/3.0.3
```

Now the system knows where the R binary is located: 
```
[johndoe@brlogin2 ~]$ which R
/opt/apps/gcc4_7/R/3.0.3/bin/R
```

## Finding a Software Package

To see what versions of the molecular dynamics software gromacs are installed, use: 
```
module spider gromacs
```

In this case, we see that versions 4.5.5 and 5.0.2 are available: 
```
  ------------------------------------------------------------------------
  gromacs:
  ------------------------------------------------------------------------
    Description:
      GROMACS 

     Versions:
        gromacs/4.5.5
        gromacs/5.0.2

  ------------------------------------------------------------------------
  To find detailed information about gromacs please enter the full name.
  For example:

     $ module spider gromacs/5.0.2
  ------------------------------------------------------------------------
```

To see how to access gromacs version 5.0.2: 

```
module spider gromacs/5.0.2
```

We see that it is built against 4 compiler/MPI stack combinations: 

```
  ------------------------------------------------------------------------
  gromacs: gromacs/5.0.2
  ------------------------------------------------------------------------
    Description:
      GROMACS 

    This module can only be loaded through the following modules:

      gcc/4.7.2, mvapich2/1.9a2
      gcc/4.7.2, openmpi/1.6.4
      intel/13.1, mvapich2/1.9a2
      intel/13.1, openmpi/1.6.4
 
    Help:
      GROMACS is a versatile and extremely
      well optimized package to perform
      molecular dynamics computer simulations
      and subsequent trajectory analysis.
                  
      GROMACS is a versatile and extremely
      well optimized package to perform
      molecular dynamics computer simulations
      and subsequent trajectory analysis.
      
      Define Environment Variables:
      
                  $GROMACS_DIR - root
                  $GROMACS_BIN - binaries
                  $GROMACS_INC - includes
                  $GROMACS_LIB - libraries
      
      Prepend Environment Variables:
      
                     PATH += $GROMACS_BIN
                  MANPATH += $GROMACS_DIR/share/man
                  INCLUDE += $GROMACS_INC
          LD_LIBRARY_PATH += $GROMACS_LIB
```
