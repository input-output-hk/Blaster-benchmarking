import LiveScripts.Shared
import LiveScripts.S_c82ed39ea34b04c159c544a956efa8e6395dbf9d703c1b4c17deaa78.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c82ed39ea34b04c159c544a956efa8e6395dbf9d703c1b4c17deaa78.script [datum, redeemer, ctx] 10000]
