import LiveScripts.Shared
import LiveScripts.S_4fb57ef30fb04217feaaa4522c70d8b52b74a8ddaf17a6c7674a7a31.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4fb57ef30fb04217feaaa4522c70d8b52b74a8ddaf17a6c7674a7a31.script [ctx] 10000]
