# UUID / GUID

Universal unique identifiyer (UUID) also know as Global unique identifiyer is 128-bit used to label information in computing systems. Generated to [RCF](https://datatracker.ietf.org/doc/html/rfc4122) standard, a UUID is unique across both space and time with respect to the space of all UUIDs. 

UUIDs are of a fixed size (128 bits) which is reasonably small compared to other alternatives.  This lends itself well to sorting, ordering, and hashing of all sorts, storing in databases, simple allocation, and ease of programming in general. Since UUIDs are unique and persistent, they make excellent Unifor Resource Names.  The unique ability to generate a new UUID without a registration process allows for UUIDs to be one of the URNs with the lowest minting cost.

The following is an example of the string representation of a UUID as a URN, `urn:uuid:f81d4fae-7dec-11d0-a765-00a0c91e6bf6`.

Format
```
urn:uuid: time-low "-" time-mid "-" time-high-and-version "-" clock-seq-and-reserved clock-seq-low "-" node
```

### Version

The version number is in the most significant (Msb) 4 bits of the timestamp (bits 4 through 7 of the time_hi_and_version field).

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

| Version |  Bits | Hex  |                    Description                |
| ------- | ----- | ---- | --------------------------------------------- |
| 0       | 0xxx2 | 0..7 | Backwards compatible with the now-obsolete Apollo Network Computing System 1.5 UUID format developed around 1988. The first 6 octets of the UUID are a 48-bit timestamp (the number of 4-microsecond units of time since 1 January 1980 UTC); the next 2 octets are reserved; the next octet is the "address family"; and the final 7 octets are a 56-bit host ID in the form specified by the address family. Though different in detail, the similarity with modern version-1 UUIDs is evident. The variant bits in the current UUID specification coincide with the high bits of the address family octet in Networking Computing System (NCS) UUIDs. Though the address family could hold values in the range 0..255, only the values 0..13 were ever defined. Accordingly, the variant-0 bit pattern 0xxx avoids conflicts with historical NCS UUIDs, should any still exist in databases.|
| 1       | 10xx2 | 8..b | 2 bit variant, referred to as RFC 4122/DCE 1.1 UUIDs, or "Leach–Salz" UUIDs, after the authors of the original Internet Draft.|
| 2       | 110x2 | c..d | 3 bit variant, characterized in the RFC as "reserved, Microsoft Corporation backward compatibility" and was used for early GUIDs on the Microsoft Windows platform. It differs from variant 1 only by the endianness in binary storage or transmission: variant-1 UUIDs use "network" (big-endian) byte order, while variant-2 GUIDs use "native" (little-endian) byte order for some subfields of the UUID.|
| 3       | 111x2 | e..f | 3 bit variant, reserved. |

