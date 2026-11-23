import LiveScripts.Shared
import LiveScripts.S_f7dde72bdb2b1fb8cbb743be82c749d9bde14becaebb2cc6abf21009.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f7dde72bdb2b1fb8cbb743be82c749d9bde14becaebb2cc6abf21009.script [datum, redeemer, ctx] 10000]
