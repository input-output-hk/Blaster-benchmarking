import LiveScripts.Shared
import LiveScripts.S_4c93a9ae9ebbdea562d367287ef6471e162cc3ba41030367bd55cf71.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4c93a9ae9ebbdea562d367287ef6471e162cc3ba41030367bd55cf71.script [ctx] 10000]
