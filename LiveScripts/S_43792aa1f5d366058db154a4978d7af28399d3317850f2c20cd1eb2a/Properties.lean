import LiveScripts.Shared
import LiveScripts.S_43792aa1f5d366058db154a4978d7af28399d3317850f2c20cd1eb2a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_43792aa1f5d366058db154a4978d7af28399d3317850f2c20cd1eb2a.script [datum, redeemer, ctx] 10000]
