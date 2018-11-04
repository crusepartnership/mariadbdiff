# Maria DB Diff
Check for differences between two schemas, and scream like hell if there are any.
Useful for diffing (obvs), also useful for CI integration

## Prerequisites
To use mariadbdiff, you'll need to have [docker](https://docs.docker.com/install/) installed 

## Installation 
### npm
```
npm install -g mariadbdiff
```


### git
```
git clone https://github.com/crusepartnership/mariadbdiff.git
```

## Usage

```
mariadbdiff --source-schema=/path/to/source.sql --target-schema=/path/to/target.sql
```

## (Re)Build
To rebuild the docker container, run the following

```
sh build
```
