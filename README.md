# eprev_talon

Extension of https://github.com/knausj85/knausj_talon.

```
cd ~/.talon/user
git clone https://github.com/knausj85/knausj_talon 0-knausj_talon
git clone https://github.com/eprev/eprev_talon.git 1-eprev_talon
```

```
cat ~/.talon/user/engines.py
from talon import speech_system
from talon.engines.webspeech import WebSpeechEngine
webspeech = WebSpeechEngine()
speech_system.add_engine(webspeech)
```
