import LiveScripts.Shared
import LiveScripts.S_62bb15445ed71029afaeec2069458cd0678ca93ce36f7bd83db2e188.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_62bb15445ed71029afaeec2069458cd0678ca93ce36f7bd83db2e188.script [ctx] 10000]
