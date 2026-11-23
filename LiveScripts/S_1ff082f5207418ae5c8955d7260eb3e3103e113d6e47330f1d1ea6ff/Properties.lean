import LiveScripts.Shared
import LiveScripts.S_1ff082f5207418ae5c8955d7260eb3e3103e113d6e47330f1d1ea6ff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1ff082f5207418ae5c8955d7260eb3e3103e113d6e47330f1d1ea6ff.script [ctx] 10000]
