import LiveScripts.Shared
import LiveScripts.S_73dead11ca9e387fef50a8a68726a68273d607eea0f1d2bde205140f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_73dead11ca9e387fef50a8a68726a68273d607eea0f1d2bde205140f.script [ctx] 10000]
