import LiveScripts.Shared
import LiveScripts.S_f0ae09dc00399b290e989ccaec5b644fb09ca91835c6e9929b8d77c1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f0ae09dc00399b290e989ccaec5b644fb09ca91835c6e9929b8d77c1.script [ctx] 10000]
