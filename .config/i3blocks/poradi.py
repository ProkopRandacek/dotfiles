#!/bin/python

import requests

url = "http://i.protab.cz/poradi"

r = requests.get(url)
page = str(r.content).replace("\\n", "\n").replace("\\t", "")
page = page[: page.index("Prokop")]
poradi = page.split("\n")[-2][18:20].replace(".", "")
print(f"Jsem {poradi}.")
