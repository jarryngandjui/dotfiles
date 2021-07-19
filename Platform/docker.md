# Docker
[Content addressable storage](https://en.wikipedia.org/wiki/Content-addressable_storage)
[UnionFS](https://en.wikipedia.org/wiki/UnionFS)

## Registry
A registry is a storage and content delivery system, holding named Docker images, available in different tagged versions.

You absolutely need to be familiar with Docker, specifically with regard to pushing and pulling images. You must understand the difference between the daemon and the cli, and at least grasp basic concepts about networking.

Also, while just starting a registry is fairly easy, operating it in a production environment requires operational skills, just like any other service. You are expected to be familiar with systems availability and scalability, logging and log processing, systems monitoring, and security 101. Strong understanding of http and overall network communications, plus familiarity with golang are certainly useful as well for advanced operations or hacking. [effective golang](https://golang.org/doc/effective_go)

[Next generation registry](https://github.com/docker-archive/docker-registry/issues/612)
## Images
A __docker image__ is made up of one or more layers and some metadata. When you do a docker pull these are retrieved from dockerhub or your repository of choice.

Under the hood, each docker layer is is actually the sha256 of the contents of the layer called the __digest__:
```
$ cat 1160f4abea84cbe2f316db6306839d2704f09a04af763ee493dd92cb066c0865 | shasum -a 256
1160f4abea84cbe2f316db6306839d2704f09a04af763ee493dd92cb066c0865  -
```

Metadata lives in the __manifest.json__ for the docker image format v1. Expect to find the following:
- __config__ - contains metadata about image creation
- __layers__ - list of layers digest for each of it's layers, as well as the size and the format of the file

The digest for the manifest acts as the root node, and the digest for the layers are the leaves in the [merkle tree](https://en.wikipedia.org/wiki/Merkle_tree) for a docker image. 

[Proposal for signable images and content addressable images](https://github.com/moby/moby/issues/8093)
## Utilities
__skopeo__ is a command line utility that performs various operations on container images and image repositories. Use skopeo to pull the raw docker image into a folder and take a look at it.

```
skopeo copy docker://dyego/snake-game:latest dir:./
1160f4abea84cbe2f316db6306839d2704f09a04af763ee493dd92cb066c0865
194910951a14ae1c018dbb76537380240c31a7573411abbe1abc8c0c78f410f6
20ccf4425819fbf3045577b0954f38b0b1fe636447dcfb2e7ab51b56119d720a
3ee103c86f6069f2ce62589cd1227005febfb70eb986a90a1b39af090769f2cf
4b3db85b3b19a9e472b818bcdb61efbbc376b308630df69544e97c09ee6ef366
4d49542c61a48835965105e24434036ff74a67dde0d7560a6f55219b5980e1c1
67e0ebed9a3b9232682631f4cfe09da2ee26e0761e935f723b81e9e3bcadf138
97b9447a34eca52d4283759df0f47f42cb9629b3ab6058fca5a993cfacb1e7a8
9a56d2eb1eedd2ba6239a29cf279531ebf0b0bf0f1d29736f7b11ab0d98ab431
ab455ad83399d5f68cc1b402ad4231854b30c408b27ca277544fb2c0d24e7c15
b612933e98de5544206641c6319e1fbe1a7269aafbeca9fbf07bf8b6f0055198
manifest.json
```