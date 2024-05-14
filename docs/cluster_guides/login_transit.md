# Log in to Transit

Below is a step-by-step procedure to login to [Transit](../cluster_guides/transit.md).

## 1. Get within SUNET

[Get inside the university networks](../getting_started/get_inside_sunet.md).

???- question "Forgot how to get within SUNET?"

    See the 'get inside the university networks' page [here](../getting_started/get_inside_sunet.md)

## 2. Use SSH to login

On your local computer, start a terminal and use [`ssh`](../software/ssh.md) to login to Transit:

```
ssh [username]@transit.uppmax.uu.se
```

where `[username]` is your UPPMAX username, for example:

```
ssh sven@transit.uppmax.uu.se
```

If you haven't setup using SSH keys, you will be asked for your UPPMAX password.

If this is your first time on Transit, you will be asked for adding
it to your list of known hosts. Type `yes`.

???- question "How does that look like?"

    This is how it looks like when you are asked
    for adding Transit to your list of known hosts.

    ![](./img/transit_add_to_known_hosts.png)

You are now logged in to Transit!

![](./img/logged_in_transit.png)
