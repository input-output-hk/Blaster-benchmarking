import LiveScripts.Shared
import LiveScripts.S_11e6b6501ac40aba725a0373d00b590f51c1ee073a4190d3a538b5fd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_11e6b6501ac40aba725a0373d00b590f51c1ee073a4190d3a538b5fd.script [ctx] 10000]
