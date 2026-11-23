import LiveScripts.Shared
import LiveScripts.S_a85dd21b1a954a16bcd2c5bf95b313cc96c64bc0f7c79856d7161712.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a85dd21b1a954a16bcd2c5bf95b313cc96c64bc0f7c79856d7161712.script [ctx] 10000]
