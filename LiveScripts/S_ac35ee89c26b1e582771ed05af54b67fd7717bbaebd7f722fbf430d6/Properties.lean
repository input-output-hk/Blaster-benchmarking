import LiveScripts.Shared
import LiveScripts.S_ac35ee89c26b1e582771ed05af54b67fd7717bbaebd7f722fbf430d6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ac35ee89c26b1e582771ed05af54b67fd7717bbaebd7f722fbf430d6.script [ctx] 10000]
