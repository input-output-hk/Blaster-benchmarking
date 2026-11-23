import LiveScripts.Shared
import LiveScripts.S_4c483888859e6813147c05424503b6573e98e678ca509da1c605fba5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4c483888859e6813147c05424503b6573e98e678ca509da1c605fba5.script [ctx] 10000]
