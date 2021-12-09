# **FIREWALL**
>A Linux firewall is a solution or service that regulates, protects, and blocks network traffic as it passes to and from a Linux-based environment.<br>
>The Linux kernel includes the **Netfilter** subsystem, which is used to manipulate or decide the fate of network traffic headed into or through your server. All modern Linux firewall solutions use this system for packet filtering.

## **netfilter**
>* The Linux kernel includes the Netfilter subsystem, which is used to manipulate or decide the fate of network traffic headed into or through your server. All modern Linux firewall solutions use this system for packet filtering.
>* The netfilter provides packet filtering software for the Linux 2.4.x and later kernel series. The netfilter project is commonly associated with **iptables** and its successor **nftables**, it filtering inside the kernel : network packet, network address, port number ...


## **iptables**
>ptables is the database of firewall rules and is the actual firewall used in Linux systems.<br>
>it is a generic firewalling software that allows you to define rulesets. Each rule within an IP table consists of a number of classifiers (iptables matches) and one connected action (iptables target).

## **nftables**
>nftables is the successor of iptables, it allows for much more flexible, scalable and performance packet classification. This is where all the fancy new features are developed.

<br>

### ***iptables display rules***

<br>

1. *List the rules in a chain or all chains for the fist time.*

```bash
	$iptables -L (OR) $iptables -S 				['RTFM']
```
```bash
	#OUTPUT :
		Chain INPUT (policy ACCEPT)
		target     prot opt source               destination

		Chain FORWARD (policy ACCEPT)
		target     prot opt source               destination

		Chain OUTPUT (policy ACCEPT)
		target     prot opt source               destination

```
2. *dispay number side rules*

```bash
	$iptables -L --line-number				['RTFM']
```

```bash
		Chain INPUT (policy ACCEPT)
		num  target     prot opt source               destination
		1 👈   DROP       icmp --  anywhere             anywhere
		2 👈   DROP       all  --  10.11.100.47         anywhere

		Chain FORWARD (policy ACCEPT)
		num  target     prot opt source               destination

		Chain OUTPUT (policy ACCEPT)
		num  target     prot opt source               destination
```
3. *dispay specific Chain*

```bash
	$iptables -L INPUT --line-numbers			['RTFM']
```

```
		Chain INPUT (policy ACCEPT)
		num  target     prot opt source               destination
		1    DROP       icmp --  anywhere             anywhere
		2    DROP       all  --  10.11.100.47         anywhere
```
4. *dispay with numeric format*

```bash
	$iptables -L INPUT -n					['RTFM']
```

```bash
	#OUTUPT:
		Chain INPUT (policy ACCEPT)
		target     prot opt source               destination
		DROP       all  --  0.0.0.0/0             192.168.10.12
		DROP       all  --  192.168.10.11        0.0.0.0/0

```
5. *DROP INPUT (to testing)*

> first we can send packets to google (for example)

```bash
	$ping google.com					['ping any website to check 😏']
```
```bash
	#OUTPUT :
		PING google.com (172.217.171.206) 56(84) bytes of data.
		64 bytes from mrs09s06-in-f14.1e100.net (172.217.171.206): icmp_seq=1 ttl=111 time=26.6 ms
		64 bytes from mrs09s06-in-f14.1e100.net (172.217.171.206): icmp_seq=2 ttl=111 time=26.4 ms
		64 bytes from mrs09s06-in-f14.1e100.net (172.217.171.206): icmp_seq=3 ttl=111 time=26.2 ms
		64 bytes from mrs09s06-in-f14.1e100.net (172.217.171.206): icmp_seq=4 ttl=111 time=26.4 ms
		64 bytes from mrs09s06-in-f14.1e100.net (172.217.171.206): icmp_seq=5 ttl=111 time=26.5 ms

		--- google.com ping statistics ---
		5 packets transmitted, 5 received, 0% packet loss, time 4007ms
		rtt min/avg/max/mdev = 26.240/26.437/26.646/0.133 ms
```

✅ Connetion Checked<br>
>After DROPING INPUT (see what's happened) with the following cmd :
```bash
	$iptables -P OUTPUT DROP				['RTFM']
```
```
		Chain INPUT (policy ACCEPT)
		target     prot opt source               destination

		Chain FORWARD (policy ACCEPT)
		target     prot opt source               destination

		Chain OUTPUT (policy DROP) 👈
		target     prot opt source               destination
```
>Now we try to ping (send & reci packets)
```bash
	$ping google.com
```
```bash
	#OUTPUT:
		ping: google.com: Temporary failure in name resolution
```
❌ NO Connection <br>

>Because We have blocked the OUTPUT<br>
>Yeah we can insert multiples rules to controle packets trafic like stoping a spesific ip@<br>
>to talk with us or deny our machine to send packets to some ip@ or more, or just blocking smpt protocol,<br>
>i don't know why but let's block sending mail.
```bash
	#Example
```
>like we said before, { DROP INPUT } , { ACCEPT OUTPUT } <br>
>but if we want to send mail to some one, it will be sent with no problem<br>
>now to block sending mail use the following command

```bash
		$iptables -I OUTPUT -p smtp -j DROP 👈
		[UFW] 👉 $ufw deny out smpt
```

1. *Inserting rules*

```bash
	$iptables -I INPUT -s 10.11.100.47 -j DROP 👈	['RTFM']
```
```bash
	$iptables -I INPUT -p icmp -j DROP 👈			['RTFM']
```

```bash
	#OUTPUT:
		Chain INPUT (policy ACCEPT)
		target     prot opt source               destination
		DROP       icmp --  anywhere             anywhere👈
		DROP       all  --  10.11.100.47         anywhere👈

		Chain FORWARD (policy ACCEPT)
		target     prot opt source               destination

		Chain OUTPUT (policy ACCEPT)
		target     prot opt source               destination
```
>that means we reject all traffic from 10.11.100.47 within INPUT table and drop ICMP traffic (no ping any more).

<br>

7. *Empty chain (FLUSH)*
```bash
	$iptables -F INPUT					['RTFM']
```
```
		Chain INPUT (policy ACCEPT)
		num  target     prot opt source               destination

		Chain FORWARD (policy ACCEPT)
		num  target     prot opt source               destination

		Chain OUTPUT (policy ACCEPT)
		num  target     prot opt source               destination
```
>clearing the INPUT chain from rules<br>
>use : ( $iptable -F ), to clear all chains.

<br>

8. *Clear iptable*
```bash
	$iptables -X						['RTFM']
```
>if we want to clear any other chains besides defaults chains

<br>

1. *Summary*
>The kernel’s packet filtering system would be of little use to administrators without a userspace interface to manage it. This is the purpose of iptables: When a packet reaches your server, it will be handed off to the Netfilter subsystem for acceptance, manipulation, or rejection based on the rules supplied to it from userspace via iptables. Thus, iptables is all you need to manage your firewall, if you’re familiar with it, but many frontends are available to simplify the task.

<br>

# UFW (Uncomplicated Firewall)
>Developed to ease iptables firewall configuration, ufw provides a user-friendly way to create an IPv4 or IPv6 host-based firewall.<br>
> default policies are :<br>
> - *incomng connnections deny them*<br>
> - *outgoing connnections allow them*

>⚠️ <br>“ufw is not intended to provide complete firewall functionality via its command interface, but instead provides an easy way to add or remove simple rules. It is currently mainly used for host-based firewalls.”

```bash
	$ufw default deny incoming
	$ufw default allow outgoing
```
```bash
	#this meaning the following :

		Chain INPUT (DROP)		👈
		Chain FORWARD (DROP)	👈
		Chain OUTPUT (ACCEPT)	👈
```
<br>

***The following are some examples of how to use ufw:***

1. *show status*

```bash
	$systemctl status ufw
```
```bash
	# OUTPUT :
		ufw.service - Uncomplicated firewall
		Loaded: loaded (/lib/systemd/system/ufw.service; enabled; vendor preset: enabled)
		Active: active (exited) since Mon 2021-11-29 10:28:45 +01; 48min ago
		Docs: man:ufw(8)
		Process: 326 ExecStart=/lib/ufw/ufw-init start quiet (code=exited, status=0/SUCCESS)
		Main PID: 326 (code=exited, status=0/SUCCESS)
			CPU: 1ms

		Warning: journal has been rotated since unit was started, output may be incomplete.
```
> ufw already started ,for stop service :
> ```bash
>	$systemctl stop ufw
> ```


```bash
	$ufw status
```
```bash
	# OUTPUT :
		Status: inactive  👈 "no rule added yet"
```

2. *allowing / denying*
* allow ssh

```bash
	$ufw allow ssh <or> $ufw allow 22/tcp
```
* allow http
```bash
	$ufw allow http
```

```bash
	$ufw status
```
```bash
	22/tcp                     ALLOW       Anywhere
	80/tcp                     ALLOW       Anywhere
	22/tcp (v6)                ALLOW       Anywhere (v6)
	80/tcp (v6)                ALLOW       Anywhere (v6)
```
- [x] ssh & http use tcp protocole

3. *reset UFW*

```bash
	$ufw reset
```
### to be continued 💤
