# [UUID / GUID](https://en.wikipedia.org/wiki/Universally_unique_identifier)

Universal unique identifiyer (UUID) also know as Global unique identifiyer is 128-bit used to label information in computing systems. Generated to the [RCF, Leach, et al.](https://datatracker.ietf.org/doc/html/rfc4122) standard, a UUID is unique across both space and time with respect to the space of all UUIDs. 

UUIDs are of a fixed size (128 bits) which is reasonably small compared to other alternatives.  This lends itself well to sorting, ordering, and hashing of all sorts, storing in databases, simple allocation, and ease of programming in general. Since UUIDs are unique and persistent, they make excellent Unifor Resource Names.  The unique ability to generate a new UUID without a registration process allows for UUIDs to be one of the URNs with the lowest minting cost.

The following is an example of the string representation of a UUID as a URN, `urn:uuid:f81d4fae-7dec-11d0-a765-00a0c91e6bf6`.

Format
```
urn:uuid: time-low "-" time-mid "-" time-high-and-version "-" clock-seq-and-reserved-clock-seq-low "-" node
```

### Version

The version number is in the most significant 4 bits (Msb0-4) of the timestamp (bits 4 through 7 of the time_hi_and_version field).

Using the example UUID (`urn:uuid:f81d4fae-7dec-11d0-a765-00a0c91e6bf6`), the time_hi_and_version is `(1)1d0`. The most significant 4 bits of the time_hi_and_version field are `0001`, so this UUID is version 1. 


The following table lists the currently-defined versions for this UUID variant.

| Msb0 | Msb1 | Msb2 | Msb3 | Version | Description |
| ---- | ---- | ---- | ---- | ------- | ----------- |
| 0    | 0    | 0    | 1    |    1    | The time-based version specified in this document.|
| 0    | 0    | 1    | 0    |    2    | DCE Security version, with embedded POSIX UIDs.|
| 0    | 0    | 1    | 1    |    3    | The name-based version specified in this document that uses MD5 hashing.|
| 0    | 1    | 0    | 0    |    4    | The randomly or pseudo-randomly generated version specified in this document.|
| 0    | 1    | 0    | 1    |    5    | The name-based version specified in this document that uses SHA-1 hashing.|


### Variants

The variant field determines the layout of the UUID. That is, the interpretation of all other bits in the UUID depends on the setting of the bits in the variant field. It is the most significat bits 3 (Msb0-3) of the clock-seq-and-reserved-clock-seq-low field.

Using the example UUID (`urn:uuid:f81d4fae-7dec-11d0-a765-00a0c91e6bf6`), the clock-seq-and-reserved-clock-seq-low is `(a)765`. The most significant 3 bits of the time_hi_and_version field are `1010`, so this UUID is version 1. 


| Msb0 | Msb1 | Msb2 | Version |  Bits | Hex  |                    Description                |
| ---- | ---- | ---- | ------- | ----- | ---- | --------------------------------------------- |
| 0    | 0    | 0    | 0       | 0xxx2 | 0..7 | Backwards compatible with the now-obsolete Apollo Network Computing System 1.5 UUID format developed around 1988.|
| 1    | 0    | 0    | 1       | 10xx2 | 8..b | 2 bit variant, referred to as RFC 4122/DCE 1.1 UUIDs, or "Leach–Salz" UUIDs, after the authors of the original Internet Draft.|
| 1    | 1    | 0    | 2       | 110x2 | c..d | 3 bit variant, characterized in the RFC as "reserved, Microsoft Corporation backward compatibility" and was used for early GUIDs on the Microsoft Windows platform. It differs from variant 1 only by the endianness in binary storage or transmission: variant-1 UUIDs use "network" (big-endian) byte order, while variant-2 GUIDs use "native" (little-endian) byte order for some subfields of the UUID.|
| 1    | 1    | 1    | 3       | 111x2 | e..f | 3 bit variant, reserved for future definition.|

### Security

Do not assume that UUIDs are hard to guess; they should not be used as security capabilities (identifiers whose mere possession grants access), for example.  A predictable random number source will exacerbate the situation.

### Collisions

Collision occurs when the same UUID is generated more than once and assigned to different referents. In the case of standard version-1 and version-2 UUIDs using unique MAC addresses from network cards, collisions can occur only when an implementation varies from the standards, either inadvertently or intentionally.

In contrast to version-1 and version-2 UUID's generated using MAC addresses, with version-1 and -2 UUIDs which use randomly generated node ids, hash-based version-3 and version-5 UUIDs, and random version-4 UUIDs, collisions can occur even without implementation problems, albeit with a probability so small that it can normally be ignored. This probability can be computed precisely based on analysis of the [birthday problem](https://en.wikipedia.org/wiki/Birthday_problem).

For example, the number of random version-4 UUIDs which need to be generated in order to have a 50% probability of at least one collision is 2.71 quintillion, computed as by This number is equivalent to generating 1 billion UUIDs per second for about 85 years. A file containing this many UUIDs, at 16 bytes per UUID, would be about 45 exabytes.

Thus, the probability to find a duplicate within 103 trillion version-4 UUIDs is one in a billion.

[The smallest number of version-4 UUIDs which must be generated for the probability of finding a collision to be p is approximated by the formula](https://en.wikipedia.org/wiki/Universally_unique_identifier#Collisions)


