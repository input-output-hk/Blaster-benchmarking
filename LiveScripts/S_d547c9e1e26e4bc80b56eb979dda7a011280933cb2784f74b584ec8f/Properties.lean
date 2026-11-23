import LiveScripts.Shared
import LiveScripts.S_d547c9e1e26e4bc80b56eb979dda7a011280933cb2784f74b584ec8f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d547c9e1e26e4bc80b56eb979dda7a011280933cb2784f74b584ec8f.script [ctx] 10000]
