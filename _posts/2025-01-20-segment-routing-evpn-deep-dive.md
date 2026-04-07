---
layout: post
title: "Segment Routing + EVPN: The Backbone of Modern Data Centre Fabrics"
subtitle: "Why the convergence of SR-MPLS and EVPN is powering next-gen cloud networks"
date: 2025-01-20
tags: [Networking, BGP, EVPN, SegmentRouting, MPLS, DataCentre]
cover-img: "/assets/img/bg-tech-1.jpg"
thumbnail-img: "/assets/img/thumb-networking.png"
share-img: "/assets/img/bg-tech-1.jpg"
---

Having spent 15+ years working on carrier-grade routing platforms — from the earliest MPLS TE deployments to today's Segment Routing fabrics — I've had a front-row seat to one of the most significant architectural shifts in networking: the convergence of **Segment Routing** and **EVPN**.

## Why Segment Routing?

Traditional MPLS required LDP or RSVP-TE to distribute labels — complex, stateful protocols that didn't scale well as networks grew to hundreds of nodes. **Segment Routing (SR)** solved this by encoding forwarding instructions directly into the packet header, eliminating the need for per-flow state in the network.

There are two flavours:
- **SR-MPLS**: Uses the existing MPLS data plane — backward compatible with legacy infrastructure
- **SRv6**: Extends SR concepts to IPv6 using a new extension header — cloud-native friendly

```
# Example SR-MPLS label stack for an inter-domain path
[Node SID: 16001] → [Adj SID: 24004] → [Payload]
```

## EVPN: The Control Plane Revolution

EVPN (Ethernet VPN, RFC 7432) replaced proprietary MAC learning with a BGP-based control plane. The key innovations:

- **MAC/IP advertisement** via BGP routes (Type 2) eliminates flood-and-learn
- **Multi-homing** with LACP-like redundancy across multiple PE routers (Type 1/4)
- **Integrated routing and bridging** — a single control plane for L2 and L3

## SR + EVPN Together

The real magic happens when you combine the two:

| Challenge | SR Solution | EVPN Solution |
|-----------|-------------|---------------|
| Path engineering | SR-TE policies with explicit segment lists | — |
| MAC/IP mobility | — | BGP route updates |
| Multi-homing | — | ESI-based redundancy |
| Traffic localisation | Anycast SID | ESI-based DF election |

In our Comcast deployment, this combination enabled us to build a **multi-domain MPLS fabric** with sub-50ms convergence, seamless multi-homing, and zero reliance on LDP.

## Practical Considerations

**Watch your SID allocation.** In large SR deployments, SID space management becomes critical. Plan your Node SID and Adj SID allocation ranges early.

**EVPN Type 5 for DCI.** For data centre interconnect, EVPN Type 5 (IP Prefix Advertisement) is more scalable than Type 2 across WAN links.

**Test your convergence.** BGP-based MAC withdrawal on link failure is fast, but test your failover under realistic traffic load — not just ping.

---

*Want to discuss SR/EVPN architectures or network design? [Let's connect](/contact).*
