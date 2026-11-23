import LiveScripts.Shared
import LiveScripts.S_0d1df973dfef8d12d1ab57bea745341d4568b35e922a6fec5c6f470b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0d1df973dfef8d12d1ab57bea745341d4568b35e922a6fec5c6f470b.script [ctx] 10000]
