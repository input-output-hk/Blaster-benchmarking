import LiveScripts.Shared
import LiveScripts.S_d390530197cb47a6e280e90e1fb92f7fcaabad48e6e712ab79c18c34.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d390530197cb47a6e280e90e1fb92f7fcaabad48e6e712ab79c18c34.script [ctx] 10000]
