import LiveScripts.Shared
import LiveScripts.S_6d57843bd1a5312484bdcdc0620f922d70f7d3781d6912bec4c67201.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6d57843bd1a5312484bdcdc0620f922d70f7d3781d6912bec4c67201.script [ctx] 10000]
