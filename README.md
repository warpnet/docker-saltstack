# Readme
Deze readme beschrijft de installatie van de benodigde docker images voor de salt+pizza night van Warpnet.

# Salt Master
## Docker builden
```bash
cd saltmaster
docker build -t saltmaster .
```

## Docker instance starten

**! Let op:** Er wordt een lokaal pad verbonden aan de docker instance. Dit pad dien je aan te passen naar je eigen werkstation/configuratie.

```bash
docker run --hostname saltmaster --name saltmaster -v /home/jeffrey/documents/git/warpnet/docker-salt/saltmaster/srv/salt:/srv/salt -v /home/jeffrey/documents/git/warpnet/docker-salt/saltmaster/srv/pillar:/srv/pillar -i -t saltmaster
```




# Salt Minions
## Docker builden
```bash
cd saltminion
docker build -t saltminion .
```

## Docker instance starten

**! Let op:** De *saltmaster* dient te draaien voordat deze instances gestart worden

Zoals je kunt zien, wordt voor zowel **db01** als **web01** de docker build *saltminion* gebruikt.

De optie `--link saltmaster:salt` zorgt ervoor dat zowel **db01** als **web01** kunnen communiceren met de **saltmaster** container.

### db01
```bash
docker run --hostname db01 --name db01 --link saltmaster:salt -i -t saltminion
```

### web01
```bash
docker run --hostname web01 --name web01  --link saltmaster:salt -i -t saltminion
```

# Shell openen
De beste manier om een shell te openen binnen je docker instance, is door het volgende commando te gebruiken:

## saltmaster
```bash
docker exec -it "saltmaster" bash
```

## db01
```bash
docker exec -it "db01" bash
```

## web01
```bash
docker exec -it "web01" bash
```

Dit commando gebruiken, in plaats van ```docker attach```, zorgt ervoor dat je docker instance niet stopt op het moment dat je je shell sluit.
