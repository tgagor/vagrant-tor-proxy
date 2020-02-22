#!/bin/bash

(echo authenticate '""'; echo signal newnym; echo quit) | nc localhost 9051
