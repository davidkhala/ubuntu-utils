## Difference between chronyd and ntpd
Things chronyd can do better than ntpd are:

    - chronyd can work well when external time references are only intermittently accessible, whereas ntpd needs regular polling of time reference to work well.
    - chronyd can perform well even when the network is congested for longer periods of time.
    - chronyd can usually synchronize the clock faster and with better time accuracy.
    - chronyd quickly adapts to sudden changes in the rate of the clock, for example, due to changes in the temperature of the crystal oscillator, whereas ntpd may need a long time to settle down again.
    - In the default configuration, chronyd never steps the time after the clock has been synchronized at system start, in order not to upset other running programs. ntpd can be configured to never step the time too, but it has to use a different means of adjusting the clock, which has some disadvantages.
    - chronyd can adjust the rate of the clock on a Linux system in a larger range, which allows it to operate even on machines with a broken or unstable clock. For example, on some virtual machines. 

Things chronyd can do that ntpd cannot do:

    - chronyd provides support for isolated networks where the only method of time correction is manual entry. For example, by the administrator looking at a clock. chronyd can examine the errors corrected at different updates to estimate the rate at which the computer gains or loses time, and use this estimate to trim the computer clock subsequently.
    - chronyd provides support to work out the rate of gain or loss of the real-time clock, the hardware clock, that maintains the time when the computer is turned off. It can use this data when the system boots to set the system time using an adjusted value of the time taken from the real-time clock. This is, at time of writing, only available in Linux. 

Things ntpd can do that chronyd cannot do:

    - ntpd fully supports NTP version 4 (RFC 5905), including broadcast, multicast, manycast clients and servers, and the orphan mode. It also supports extra authentication schemes based on public-key cryptography (RFC 5906). chronyd uses NTP version 3 (RFC 1305), which is compatible with version 4.
    - ntpd includes drivers for many reference clocks whereas chronyd relies on other programs, for example gpsd, to access the data from the reference clocks. 

## Chrony
- "Reference in https://docs.aws.amazon.com/zh_cn/AWSEC2/latest/UserGuide/set-time.html"    
- **chrony** use port: UDP 323"
## ntp
- **ntp** use port: UDP 123