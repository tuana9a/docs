# Make self-sign certificates valid in browser

On Windows browers like: Google Chrome, Firefox, ... automaticaly accept imported CA.\
But in Linux or other distros may be you still need to import CA to the browser manually.\
So after import your CA to you operating system. You may also need to do that again with your browser

### Chrome (Jun 29, 2022)

open Chrome Settings, then search for `certificates` then click click `Security`

![Screenshot1.png](./img/Screenshot1.png)

next choose `Manage certificates`

![Screenshot2.png](./img/Screenshot2.png)

choose tab `Authorities` then click `Import`

![Screenshot3](./img/Screenshot3.png)

browse the `ca.crt` as generated above, then the browser will ask

check as image below

![Screenshot4](./img/Screenshot4.png)

result

![Screenshot5](./img/Screenshot5.png)

## Firefox

same as chrome, do your research 👽
