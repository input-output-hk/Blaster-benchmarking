import LiveScripts.Shared
import LiveScripts.S_da73e4b601084f0119cae467dea296a760cfb6ee2fe6c564573d888f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_da73e4b601084f0119cae467dea296a760cfb6ee2fe6c564573d888f.script [datum, redeemer, ctx] 10000]
