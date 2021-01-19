# browserstack-local-smalltalk

## load
```smalltalk
Metacello new
    baseline: 'BrowserStackLocal';
    repository: 'github://mattonem/browserstack-local-smalltalk/src';
    onConflict: [ :ex | ex useIncoming ];
    ignoreImage;
    load: 'default'.   
```
