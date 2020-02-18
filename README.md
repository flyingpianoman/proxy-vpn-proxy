# proxy-vpn-proxy
A docker container that allows you to chain VPNs without nesting VMs.

## How it works
This container can setup a VPN connection to a VPN server. That connection can be tunneled trough a proxy (more on this later). The container also hosts it's own TinyProxy instance allowing other containers/apps/computers to connect to it.

The fact that this container can connect to a proxy as well as host its own proxy makes it possible to chain multiple instances. Say for examples that you have a PIA VPN as well as a Windscribe VPN and want your data to go trough both of them. You can set this up by instancing 2 containers and connecting them.

**Container A**
|Feature|Usage|
|---|---|
| Connection proxy  | None |
| VPN               | PIA |
| TinyProxy         | enabled |

**Container B**
|Feature|Usage|
|---|---|
| Connection proxy  | Container A TinyProxy |
| VPN               | Windscribe |
| TinyProxy         | enabled |

If an application connects to Container B's TinyProxy, its data will be go trough 2 nested VPN tunnels. The PIA vpn as outer tunnel and the Windscribe as inner tunnel. This creates a multiple hop setup which makes it harder to track you and also offers better anonimity from the VPN providers.

PIA will only know your original IP but won't know what you're connecting to. Winscribe will know what you're connecting to but won't know your original IP.
