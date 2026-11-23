import LiveScripts.Shared
import LiveScripts.S_83da79f531c19f9ce4d85359f56968a742cf05cc25ed3ca48c302dee.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_83da79f531c19f9ce4d85359f56968a742cf05cc25ed3ca48c302dee.script [datum, redeemer, ctx] 10000]
