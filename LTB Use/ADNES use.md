# ANDES

Install ANDES as Development Mode:
```
python3 -m pip install -e .
```

Uninstall ANDES

If install by conda:
```
conda remove andes --force
```

If install by pip3:
```
pip uninstall andes
```

Selftest:
```
andes selftest
```

Code generation:
```
andes prepare
```


Code generation by incremental:
```
andes prepare -i
```

Code generation bu full:
```
andes prepare -f
```

If your Jupyter Notebook does not show kernel andes, try follow:
1. Acticate env andes

2. Install jupyter notebook by:
```
conda install jupyter notebook
```
Or you can install complete jupyter:
```
conda install jupyter notebook
```

3. Add kernel andes into env by:
```
python -m ipykernel install --user --name andes --display-name 'andes'
