import LiveScripts.Shared
import LiveScripts.S_320ab87a9d22c74ad3e665c35e9509e6d055c8660143dc209cd05c30.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_320ab87a9d22c74ad3e665c35e9509e6d055c8660143dc209cd05c30.script [ctx] 10000]
