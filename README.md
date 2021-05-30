# browserstack-local-smalltalk

This library tend to provide with a framework to implement your Selenium test suite to be executed on Browserstack grid.


## load

```smalltalk
Metacello new
    baseline: 'BrowserStackLocal';
    repository: 'github://mattonem/browserstack-local-smalltalk/src';
    onConflict: [ :ex | ex useIncoming ];
    ignoreImage;
    load: 'default'.   
```
The loadable groups are:
- core: provides integrated browserstack credential settings and a browserstack dedicated test case super class to help you implement your test suite.
- local: core + provides test ressource for local testing, that lets you write test case for you locally host website
- parallel: core + (parallel testing)[https://github.com/mattonem/ParallelTesting]

