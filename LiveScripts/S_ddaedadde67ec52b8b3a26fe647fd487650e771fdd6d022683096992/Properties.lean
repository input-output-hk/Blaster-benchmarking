import LiveScripts.Shared
import LiveScripts.S_ddaedadde67ec52b8b3a26fe647fd487650e771fdd6d022683096992.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ddaedadde67ec52b8b3a26fe647fd487650e771fdd6d022683096992.script [ctx] 10000]
