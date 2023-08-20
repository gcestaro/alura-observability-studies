#!/bin/bash

java -jar -Xms128M -Xmx128M -Dspring.profiles.active=prod target/forum.jar
## PermSize removed at Java :8 https://stackoverflow.com/questions/18339707/permgen-elimination-in-jdk-8