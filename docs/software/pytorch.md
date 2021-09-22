(pytorch)=

# PyTorch

## Introduction

[Pytorch](https://pytorch.org), as described on their website is: "an open source machine learning framework that accelerates the path from research prototyping to production deployment".   

## Availability

PyTorch is not implicitly installed on ARC systems, but is readily installed via Conda, pip or source.  To install via Conda on TinkerCliffs or Infer, you should first get an interactive job on a GPU node (or CPU if that is where you will compute), load Anaconda and then create the environment.

```
## on TC for a100 nodes:
interact --account=<your research allocation> --partition=a100_normal_q -N 1 -n 12 --gres=gpu:1
module load Anaconda3/2020.11
module list ## make sure cuda is loaded if you are using the GPU
nvidia-smi  ## make sure you see GPUs
conda create -n pytorch
source activate pytorch
conda install pytorch torchvision torchaudio matplotlib numpy -c pytorch
```

```{warning}
NOTE: GPU support for AI/ML codes can offer SIGNIFFICANT computational speed improvments.  Simply installing the defaults as per the docs may or may not result in code utilizing the GPUs.  Test your code with a small example prior to running your full dataset.  You can ssh to the node your job is running on and use nvidia-smi to see that your code is running on the GPU.
```

## Interaction

You can run PyTorch code from Jupyter Notebooks or via the command line (interactive or scripts).  Ideally, you will prototype your code via Jupyter which is easily accessible from Open OnDemand (ood).  If instead, you would prefer to prototype your code via the command line, first get an interactive job as above in the install notes, then load the required software, eg Anaconda.

## Quick example from the pytorch.org site

The PyTorch tutorials are excellant.  For brevity, we can run through the CIFAR10 example from the PyTorch docs:  
<https://pytorch.org/tutorials/beginner/blitz/cifar10_tutorial.html#sphx-glr-beginner-blitz-cifar10-tutorial-py>  

Here is the example python script, you can run it manually or via `python cifar10.py`  

```
## cifar10.py
## import libraries
import torch
import torchvision
import torchvision.transforms as transforms

## get data and set class labels  
transform = transforms.Compose(
    [transforms.ToTensor(),
     transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])

batch_size = 4

trainset = torchvision.datasets.CIFAR10(root='./data', train=True,
                                        download=True, transform=transform)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=batch_size,
                                          shuffle=True, num_workers=2)

testset = torchvision.datasets.CIFAR10(root='./data', train=False,
                                       download=True, transform=transform)
testloader = torch.utils.data.DataLoader(testset, batch_size=batch_size,
                                         shuffle=False, num_workers=2)

classes = ('plane', 'car', 'bird', 'cat',
           'deer', 'dog', 'frog', 'horse', 'ship', 'truck')

## plot some dat for fun, if doing this via a script, you need to push this to a file or comment out
import matplotlib.pyplot as plt
import numpy as np

# functions to show an image


def imshow(img):
    img = img / 2 + 0.5     # unnormalize
    npimg = img.numpy()
    plt.imshow(np.transpose(npimg, (1, 2, 0)))
    plt.show()


# get some random training images
dataiter = iter(trainloader)
images, labels = dataiter.next()

# show images
imshow(torchvision.utils.make_grid(images))
# print labels
print(' '.join('%5s' % classes[labels[j]] for j in range(batch_size)))

## setup the NN
import torch.nn as nn
import torch.nn.functional as F


class Net(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv1 = nn.Conv2d(3, 6, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(6, 16, 5)
        self.fc1 = nn.Linear(16 * 5 * 5, 120)
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 10)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = torch.flatten(x, 1) # flatten all dimensions except batch
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x


net = Net()

## define the loss function
import torch.optim as optim

criterion = nn.CrossEntropyLoss()
optimizer = optim.SGD(net.parameters(), lr=0.001, momentum=0.9)

## train the network

for epoch in range(2):  # loop over the dataset multiple times

    running_loss = 0.0
    for i, data in enumerate(trainloader, 0):
        # get the inputs; data is a list of [inputs, labels]
        inputs, labels = data

        # zero the parameter gradients
        optimizer.zero_grad()

        # forward + backward + optimize
        outputs = net(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()

        # print statistics
        running_loss += loss.item()
        if i % 2000 == 1999:    # print every 2000 mini-batches
            print('[%d, %5d] loss: %.3f' %
                  (epoch + 1, i + 1, running_loss / 2000))
            running_loss = 0.0

print('Finished Training')

## save it if you want to keep it
PATH = './cifar_net.pth'
torch.save(net.state_dict(), PATH)

## test it if that's your thing
dataiter = iter(testloader)
images, labels = dataiter.next()

# print images
imshow(torchvision.utils.make_grid(images))
print('GroundTruth: ', ' '.join('%5s' % classes[labels[j]] for j in range(4)))

```



## Parallel Computing in Python

Coming soon-ish

## Command line running of Python

Coming soon-ish

```
module load Anaconda3/2020.11
conda create -n mypython3 python=3
source activate mypython3
```

## Managing environments

<https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html>

### Full Example





