Supported tags and respective Dockerfile links

- `latest` ([Dockerfile](https://github.com/trh-docker/freeSwitch/blob/master/Dockerfile))
- `vanilla` ([Dockerfile](https://github.com/trh-docker/freeSwitch/blob/vanilla/Dockerfile))

## FreeSWITCH

[FreeSWITCH](http://www.freeswitch.org/) docker image

- Current version is `1.10.1`

### Default FreeSWITCH image

To run default FreeSWITCH with vanilla config, default music on hold and english sound files, just type:

	docker run -d -t --name=FS --net="host" quay.io/spivegin/freeswitch:vanilla

### FreeSWITCH client

	docker run -i --rm --net="host" -t quay.io/spivegin/freeswitch:vanilla fs_cli

## User Feedback