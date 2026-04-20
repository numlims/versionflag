# versionflag

version flag for python programs.

```
import versionflag

parser = argparse.ArgumentParser()
versionflag.flag(parser, "mymodule")
```

api doc [here](https://numlims.github.io/versionflag/).

## install

download versionflag whl from
[here](https://github.com/numlims/versionflag/releases). install whl with
pip:

```
pip install versionflag-<version>.whl
```

reference from your `pyproject.toml`, e.g.:

```
dependencies = [
  "versionflag @ git+https://github.com/numlims/versionflag.git"
]
```

## install

reference from your `pyproject.toml`, e.g.:

```
dependencies = [
  "versionflag @ git+https://github.com/numlims/versionflag.git"
]
```

## dev

edit [`versionflag/init.ct`](./versionflag/init.ct) and [`versionflag/main.ct`](./versionflag/main.ct).

generate the code from ct with [ct](https://github.com/tnustrings/ct) or [ct for vscode](https://marketplace.visualstudio.com/items?itemName=tnustrings.codetext).

build and install:

```
make install
```

generate api doc:

```
make doc
```


## dev

edit [`versionflag/main.ct`](./versionflag/main.ct) and [`versionflag/init.ct`](./versionflag/init.ct).

generate the code from ct with [ct](https://github.com/tnustrings/ct) or [ct for vscode](https://marketplace.visualstudio.com/items?itemName=tnustrings.codetext).

build and install:

```
make install
```
