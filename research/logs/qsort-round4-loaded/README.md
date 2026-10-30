# Sorting, round four, abandoned under load (2026-10-27)

Round four of `sorts/PLAN.md`, started at about 13:35 on the benchmark machine (CPU 77), stopped with SIGTERM during block 6: the box's load average had climbed from about 25 in the morning to 70–100 on 128 hardware threads (other people's and other sessions' builds), the gate case took twice its morning time, and the five complete blocks give intervals of ±50%, too wide to resolve the few per cent the round is about.  Kept for the record; not analysed further.  The round is to be rerun when the box is quieter.
