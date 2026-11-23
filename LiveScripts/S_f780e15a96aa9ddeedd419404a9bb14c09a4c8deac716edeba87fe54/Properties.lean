import LiveScripts.Shared
import LiveScripts.S_f780e15a96aa9ddeedd419404a9bb14c09a4c8deac716edeba87fe54.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f780e15a96aa9ddeedd419404a9bb14c09a4c8deac716edeba87fe54.script [datum, redeemer, ctx] 10000]
