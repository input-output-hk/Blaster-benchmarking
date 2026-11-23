import LiveScripts.Shared
import LiveScripts.S_0888cb430950ea54294acec4d5b1effed40e0b1d426b6215388aa99d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0888cb430950ea54294acec4d5b1effed40e0b1d426b6215388aa99d.script [datum, redeemer, ctx] 10000]
