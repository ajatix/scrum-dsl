grammar Scrum

entry Model:
    (epics+=Epic)*;

Epic:
    'epic' name=ID ('{' (stories+=Story | after+=AfterEpic | priority=Priority)* '}')?;

AfterEpic:
    'after' epic=[Epic:ID];

Story:
    'story' name=ID ('{' (after+=AfterStory | estimate=Estimate | priority=Priority)* '}')?;

AfterStory:
    'after' story=[Story:ID];

Estimate:
    'takes' weeks=INT ('week'|'weeks')?;

Priority:
    'priority' priority=INT;

hidden terminal WS: /\s+/;
terminal ID: /[_a-zA-Z][\w_]*/;
terminal INT returns number: /[0-9]+/;


hidden terminal ML_COMMENT: /\/\*[\s\S]*?\*\//;
hidden terminal SL_COMMENT: /\/\/[^\n\r]*/;
