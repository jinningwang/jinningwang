# General Model Development Procedures for ADNES

ANDES allows users to develop new models by their own will, which can be easily done by translating block diagram into model.
Before developing your own model, it is recommended to go through the Model References, check out the existing groups and their functions.

1. Make sure you installed ANDES in development mode.
2. Find standard block diagram of your model, such as ESIG, Neplan, PowerWorld, or PSSE Model Library. If not you may need to build the block diagram.
3. Check existing models that are similar to your model, try to find similar function pieces to reduce manual efforts.
4. Build your model and finalize it.
5. Re-generate the pycode by ``andes prep``. Sometimes there occru multi-functionalities, if so you may need ``andes prep -f`` to re-generate all model codes.
6. Add an input file on a base system that include your model, such as IEEE 14-bus system or Kundur system.
7. Run the power flow to see if the initialization is success, if not you may need to tune the model initialization equations (``v_str``). Remember do run ``andes prep`` and restart the kernel every time you make change to the code.
8. After you finish youre model, check the code style (``flake8``), and then open a PR to contribute it into ADNES repo.
