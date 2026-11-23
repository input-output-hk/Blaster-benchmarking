import LiveScripts.Shared
import LiveScripts.S_5986bfcc0cbfc60dec8df87715cc95d03817aac386b0e9d33da03b39.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5986bfcc0cbfc60dec8df87715cc95d03817aac386b0e9d33da03b39.script [ctx] 10000]
