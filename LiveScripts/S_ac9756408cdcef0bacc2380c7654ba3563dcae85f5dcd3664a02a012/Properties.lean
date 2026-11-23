import LiveScripts.Shared
import LiveScripts.S_ac9756408cdcef0bacc2380c7654ba3563dcae85f5dcd3664a02a012.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ac9756408cdcef0bacc2380c7654ba3563dcae85f5dcd3664a02a012.script [datum, redeemer, ctx] 10000]
