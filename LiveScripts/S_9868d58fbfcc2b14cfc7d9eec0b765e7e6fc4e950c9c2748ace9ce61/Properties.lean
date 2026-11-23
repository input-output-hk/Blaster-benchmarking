import LiveScripts.Shared
import LiveScripts.S_9868d58fbfcc2b14cfc7d9eec0b765e7e6fc4e950c9c2748ace9ce61.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9868d58fbfcc2b14cfc7d9eec0b765e7e6fc4e950c9c2748ace9ce61.script [datum, redeemer, ctx] 10000]
