# eprev_talon

Extension of [github.com/talonhub/community](https://github.com/talonhub/community).

```
cd ~/.talon/user
git clone https://github.com/talonhub/community 0-community
git clone https://github.com/eprev/eprev_talon.git 1-eprev_talon
```

```
cat ~/.talon/user/engines.py
from talon.engines.macsf import MacSFEngine
from talon import speech_system
engine = MacSFEngine()
speech_system.add_engine(engine)
```
