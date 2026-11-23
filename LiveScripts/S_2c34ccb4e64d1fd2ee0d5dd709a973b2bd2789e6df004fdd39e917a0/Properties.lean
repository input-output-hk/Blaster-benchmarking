import LiveScripts.Shared
import LiveScripts.S_2c34ccb4e64d1fd2ee0d5dd709a973b2bd2789e6df004fdd39e917a0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2c34ccb4e64d1fd2ee0d5dd709a973b2bd2789e6df004fdd39e917a0.script [ctx] 10000]
