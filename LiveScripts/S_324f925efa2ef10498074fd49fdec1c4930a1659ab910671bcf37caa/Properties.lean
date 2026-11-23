import LiveScripts.Shared
import LiveScripts.S_324f925efa2ef10498074fd49fdec1c4930a1659ab910671bcf37caa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_324f925efa2ef10498074fd49fdec1c4930a1659ab910671bcf37caa.script [ctx] 10000]
