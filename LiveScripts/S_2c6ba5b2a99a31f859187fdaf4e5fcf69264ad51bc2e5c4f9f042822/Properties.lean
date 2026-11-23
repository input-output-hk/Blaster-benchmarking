import LiveScripts.Shared
import LiveScripts.S_2c6ba5b2a99a31f859187fdaf4e5fcf69264ad51bc2e5c4f9f042822.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2c6ba5b2a99a31f859187fdaf4e5fcf69264ad51bc2e5c4f9f042822.script [datum, redeemer, ctx] 10000]
